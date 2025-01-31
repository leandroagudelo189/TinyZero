import unittest
from main_ppo import PPOTrainer

class TestPPOTrainer(unittest.TestCase):
    def test_initialization(self):
        # Test the initialization of the PPOTrainer
        trainer = PPOTrainer()
        self.assertIsNotNone(trainer)

if __name__ == '__main__':
    unittest.main()
