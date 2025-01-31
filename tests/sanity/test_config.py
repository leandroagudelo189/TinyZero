import os
import pytest

def test_environment_variables():
    """Test if required environment variables are set."""
    required_vars = ['DATA_PATH', 'MODEL_PATH']
    for var in required_vars:
        assert var in os.environ, f"Environment variable {var} is not set."

if __name__ == '__main__':
    pytest.main([__file__])
