import unittest
from main_ppo import PPOTrainer

class TestPPOTrainerAdditional(unittest.TestCase):
    def test_training_step(self):
        # Test a single training step of the PPOTrainer
        trainer = PPOTrainer()
        initial_loss = trainer.loss()
        trainer.train_step()
        new_loss = trainer.loss()
        self.assertNotEqual(initial_loss, new_loss)

    def test_save_and_load_model(self):
        # Test saving and loading the model
        trainer = PPOTrainer()
        trainer.save_model('test_model')
        loaded_trainer = PPOTrainer()
        loaded_trainer.load_model('test_model')
        self.assertEqual(trainer.model, loaded_trainer.model)

if __name__ == '__main__':
    unittest.main()
